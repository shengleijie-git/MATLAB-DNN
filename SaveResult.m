function Loss = SaveResult(DNN, loss, errs, iter, n)
%% ����DNN����Ȩ�غͲв���һ���Loss����.
% DNN: cell���飬���δ��A1, A2, A3, ...�� E, Loss.
% Loss:��һ�����;���,��DNN���һ��Ԫ��.
% errs:���;���.
% iter:��������.
% n: ������.
% �����ʽΪ"DNN_s000001.mat".
% Ԭ���飬2019-7

Loss = loss;
step = iter + size(Loss, 2);
Loss = [Loss, errs(:, 1:iter)];
if 0 == mod(iter, n)
    DNN{end} = Loss;
    save(['DNN_s', num2str(step, '%06d'), '.mat'], 'DNN');
end

%% ����ͼ��
figure(1);
subplot(1, 2, 1);
plot(Loss(1, :), '-b');
title('loss');

figure(1);
subplot(1, 2, 2);
plot(Loss(2, :), '-r+');
hold on;
plot(Loss(3, :), '-b*');
title('acc');
legend('train', 'test', 'Location', 'SouthEast');
pause(1);

end